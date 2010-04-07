<cfif flashCount() EQ 0>
	<cftry>
		<cfset message='<p>It appears everything is set up to use the auto installer: #linkTo(route="plugins", plugin="bigrig", controller="admin", action="config", text="BigRig Auto Installer")#.</p>' />
		<cfoutput>
			#message#
			#redirectTo(route="plugins", plugin="bigrig", controller="admin", action="config")#
		</cfoutput>
	<cfcatch>
		<cfoutput>
		<div class="bigrig flash">
			<cfdump var="#cfcatch#">
			<cfif cfcatch.message EQ "Could not find the `plugins` route.">
				<p>You still need to include rigs.cfm in your config/app.cfm file in order to use this plugin:</p>
				
				<strong>/config/routes.cfm</strong>
				<pre><code>&lt;cfinclude template="plugins/bigrig/rigs.cfm" /></code></pre>
				
				<cfif NOT structKeyExists(params, "reload")>
					<p>(or <a href="?#CGI.QUERY_STRING#&reload=true">reload</a> Wheels if you already have done this)</p>
				</cfif>
			</cfif>
		</div>
		</cfoutput>
	</cfcatch>
	</cftry>
<cfelse>
	<div class="bigrig flash">
		<h3>BigRig Routes file does not exist</h3>
		<p>
			<cfoutput>#flash("bigrigInstall")#</cfoutput>
		</p>
	</div>
</cfif>