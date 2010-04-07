<cfparam name="bigrigHelperFunction" default="addRig" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
td,th { padding: 0 5px; }
.bigrig.flash { background: #FFF7F9; border: solid 1px #900; padding: 10px 25px; overflow:auto; margin: 25px 0; }
.bigrig.flash pre { width: 95%; }

.properties { text-align: right; width: 450px; }
.properties .item { margin: 5px 0 10px; padding: 20px 20px 10px; }
.properties label { display: block; font-weight: bold; padding: 2px 5px 4px; }
.properties label input { margin: 0 0 0 4px; width: 250px; }

.properties .template { display: none; }

#content a.help { float: right; font-weight: bold; text-decoration: none; margin-top: 10px; padding: 2px 5px; }

.odd { background: #f1f1f1; }
thead { font-size: 1.3em; }

.addApp.docs h3 { cursor: pointer; margin-bottom: 10px; }
#content h3 a { text-decoration: none; }
#content h3 a:hover { background: #ddd; }

p { padding: .5em 0; margin: 0; }
pre { margin: .5em 0; }

li pre { width: 590px; }

hr { margin: 10px 0; }
</style>

<script>
;(function($){
	$(function(){
		$(".details:not(.show)").hide();
		$(".<cfoutput>#bigrigHelperFunction#</cfoutput>.docs h3 a,.<cfoutput>#bigrigHelperFunction#</cfoutput>.docs .tree").click(function(){
			$(this).parents("h3,p").next(".details").slideToggle(400);
			
			return false;
		});
	
		// add a new rigging
		$(".properties a.add").click(function(){
			// grab the template item
			var item = $(".properties .template").clone().removeClass("template");
			
			// strip out the label[for] and input[id] attributes and enable the input
			// they aren't needed as the label is wrapping the input already
			$("label:has(input)", item).each(function(){
				$(this).removeAttr("for");
				$("input", this).each(function(){
					$(this).removeAttr("id");
					$(this).removeAttr("disabled");
				});
			});
			
			// fix the name of each input by incrementing the [number] part of the name
			$(".properties .template input").each(function(){
				var name = $(this).attr("name");
				
				// extract and increment the [number] identifier
				name = name.replace(/\[(\d+)\]/, function(fullMatch, n){
					return "[" + (Number(n) + 1) + "]";
				});

				// update the name attribute of the current input
				$(this).attr("name", name)
			});

			// attach the item after the last already existing item
			$(".properties .item:last").after(item);
			
			// fix the styling classes
			$(".properties .item").removeClass("odd");
			$(".properties .item:odd").addClass("odd");
			
			// cancel the click event
			return false;
		});
	});
})(jQuery);
</script>