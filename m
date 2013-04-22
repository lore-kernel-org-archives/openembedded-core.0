Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UUAqE-0007QI-E1
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 09:07:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Apr 2013 23:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,524,1363158000"; d="scan'208";a="230161109"
Received: from unknown (HELO [10.252.121.21]) ([10.252.121.21])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Apr 2013 23:49:28 -0700
Message-ID: <5174DD77.7060706@intel.com>
Date: Mon, 22 Apr 2013 09:49:27 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1366604239.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366604239.git.sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/21] Post 1.4 Updates and Fixes
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
X-List-Received-Date: Mon, 22 Apr 2013 07:07:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/22/2013 07:22 AM, Saul Wold wrote:
> Laurentiu Palcu (4):
>   fontcache.bbclass: do not exit with 1 after installing intercept hook
>   gtk-icon-cache.bbclass: do not exit 1 after installing intercept hook
>   pixbufcache.bbclass: do not exit 1 after installing intercept hook
>   image.bbclass: change the logic when intercepts fail
This version was work in progress.... I'll send the final version today.

Thanks,
Laurentiu


