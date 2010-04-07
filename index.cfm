<cfinclude template="views/docs/_header.cfm" />

<cfoutput>
<div style="float: right;padding-top: 8px;">
	<a href="http://wiki.github.com/pad/cfwheels-bigrig/">Docs</a>
</div>
</cfoutput>

<h1>BigRig Admin</h1>

<cfset reloadParam = "">
<cfif NOT structKeyExists(params, 'reload')>
	<cfset reloadParam = "&reload=true">
</cfif>

<!--- check if the plugin settings exist in the config/plugins/bigrig folder if not, make the appRoute.cfm file with initial content --->
<cfif NOT fileExists(expandPath('config/plugins/bigrig/rigs.cfm'))>
	<!--- check if the folder exists, if not make it --->
	<cfif NOT directoryExists(expandPath("config/plugins/bigrig/"))>
		<cfif NOT isDefined("params.bigrig.createRoutesFile")>
			<cfset flashInsert(bigrigInstall='<form method="post" action="?#CGI.QUERY_STRING##reloadParam#"> #checkboxTag(name="bigrig[createRoutesFile]", labelPlacement="after", label=" Create BigRig route file?")# #submitTag("Create File")#</form>(/config/plugins/bigrig/rigs.cfm)') />
		<cfelse>
			<cfif flashKeyExists("bigrigDoInstall")>
				<cfset flashDelete("bigrigDoInstall")>
			</cfif>
			<cfset structDelete(params.bigrig, "createRoutesFile") />
			<cfdirectory action="create" directory="#expandPath("config/plugins/bigrig")#" />

			<!--- add the bigrig.applicationFolders array to keep track of installed application locations --->
			<cfset loc.returnStruct.file = '<!--- BigRig Applicaiton Routes --->#chr(10)#<cfset application.wheels.bigrig.useAutoInstaller=true/>#chr(10)#<cfset addRig(name="plugins", keyword="bigrig", singleAppFolder="bigrigadmin")>' />
			<cffile action="write" file="#expandPath('config/plugins/bigrig/rigs.cfm')#" output="#loc.returnStruct.file#" />
			
			<cflocation url="?#CGI.QUERY_STRING##reloadParam#" addToken="false">
		</cfif>
	</cfif>
</cfif>

<cfinclude template="views/docs/installer.cfm">