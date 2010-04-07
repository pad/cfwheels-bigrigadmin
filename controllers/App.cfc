<cfcomponent extends="Controller">
	<cffunction name="config">
		<cfparam name="params.key" default="" />
		
		<cfset pageTitle&=" Folders">
		<cfset enableHelpBox="config">
		
		<cfset bigRigSettings = $getAppDefinitions() />
	</cffunction>
	
	<cffunction name="save">
		<cfset bigRigSettings="<!--- BigRig Applicaiton Routes --->#chr(10)#<cfset application.wheels.bigrig.useAutoInstaller=true/>#chr(10)&chr(10)#">
		<!--- grab and loop through the submitted rigs --->
		<cfset rigs = params.bigRigSettings />
		<cfloop list="#listSort(structKeyList(rigs), 'numeric')#" index="i">
			<cfif structKeyExists(rigs, i)>
				<cfset bigRigSettings &= $getFunctionCode(bigrigHelperFunction, rigs[i], "name,keyword,singleAppFolder")>
			</cfif>
		</cfloop>

		<cfset bigRigSettings &= "#chr(10)#<!---#chr(10)#    Last edited by BigRig Admin plugin #chr(10)#    #dateFormat(now(),"yyyy/mm/dd")# - #timeFormat(now(),"HH:mm:ss")# #chr(10)#    IP: #CGI.REMOTE_ADDR# #chr(10)#--->">
		
		<cffile action="write" file="#expandPath('/config/plugins/bigrig/rigs.cfm')#" output="#bigrigSettings#" />
		<cfset redirectTo(true)>
	</cffunction>
</cfcomponent>