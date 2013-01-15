Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tv3SD-0005pZ-UX
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 11:09:15 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jan 2013 01:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,473,1355126400"; d="scan'208";a="273905875"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2013 01:53:51 -0800
Message-ID: <50F5272F.7010605@intel.com>
Date: Tue, 15 Jan 2013 11:53:51 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
References: <1358242271-18841-1-git-send-email-andrei.adrianx.dinu@intel.com>
In-Reply-To: <1358242271-18841-1-git-send-email-andrei.adrianx.dinu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] Removed undisplayed picture from connman-gnome
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 10:09:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/15/2013 11:31 AM, Andrei Dinu wrote:
> +From 5907a23ad2f49702960a33f9e2039552673eabc7 Mon Sep 17 00:00:00 2001
> +From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +Date: Mon, 17 Dec 2012 14:01:18 +0200
> +Subject: [PATCH] Removed icon from connman-gnome "about" applet
> +
> +The connman-gnome "about" applet showed a picture that
> +can not be displayed. There is no designated picture
> +in connman-gnome to be used in the about section, so
> +it was removed.
> +
> +[OE-Core #2509]
> +
> +Upstream status : pending
Apparently, the correct format would be:
Upstream-Status : Pending


Thanks,
Laurentiu


