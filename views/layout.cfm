<cfinclude template="../../../wheels/styles/header.cfm">
<cfinclude template="docs/_header.cfm">

<cfoutput>
	<!--- TODO: partials! 
	#includePartial("docs/header")# --->
	<h1>#pageTitle#</h1>
	<cfif flashKeyExists("bigrig")>
		<div class="bigrig flash">#flash("bigrig")#</div>
	</cfif>
	#contentForLayout()#
	<cfif enableHelpBox NEQ "" AND NOT params.key IS "help">
		#linkTo(key="help", action="config", text="?", class="help")#
	<cfelse>
		#linkTo(key="", action="config", text="X", class="help")#
	</cfif>
	<cfif enableHelpBox NEQ "" AND params.key IS "help">
		#includePartial("/docs/add-rig")#
	</cfif>
	<div style="clear:both;"></div>
</cfoutput>
<cfinclude template="../../../wheels/styles/footer.cfm">