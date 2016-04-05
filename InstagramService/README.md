##Instagram Service
This library will help you to login with Instagram and get user's data from Instagram.

To be able to use this library, you need to set up Instagram client. You can do that by access this [page] (https://www.instagram.com/developer/clients/manage/). After creating Instagram client, please notice the **Client ID** and **Client Secret**, **Redirect URIs**. These values will be used in the iOS application.

##Installation
Copy 6 files to your project:

- QueryService.h
- QueryService.m
- InstagramService.h
- InstagramService.m
- InstagramAuthenticationViewController.h
- InstagramAuthenticationViewController.m

Copy **Client ID**, **Client Secret**, **Redirect URIs** to **InstagramAuthenticationViewController.h** (this important step to integrate your Facebook client to your iOS project)


##How to use

In the class where you want to log into Instagram and get user information, just import **InstagramAuthenticationViewController.h**. This view controller will show a login dialog and authenticate user to get user information.

The technique of InstagramAuthenticationViewController is showed below:

- Create authorization requests that use the [Server-Side (Explicit) OAuth flow] (https://www.instagram.com/developer/authentication/). This is the 1st step in this flow.
- After logging in, the web view will redirect to your **redirect URIs** with a code. We retrieve this code from URI. This is the 2nd step in the flow.
- We use this code to request access token. We will receive a package OAuth Token like this

		{	 
			"access_token": "fb2e77d.47a0479900504cb3ab4a1f626d174d2d",
			"user": {
		        "id": "1574083",
		        "username": "snoopdogg",
		        "full_name": "Snoop Dogg",
		        "profile_picture": "..."
		    }
		}
	
- The final step: we use access token to retrieve user information by Instagram Endpoints for users, which is clearly described [here] (https://www.instagram.com/developer/endpoints/users/#get_users)

##Improvements
Anyone can fork to modify this project. If you want me to add/improve this project, please post to the Issue.
	
##Licences
All source files are licensed under MIT license.