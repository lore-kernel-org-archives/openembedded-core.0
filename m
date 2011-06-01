Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QRpNL-0004NN-Ua
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:38:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Jun 2011 10:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,304,1304319600"; d="scan'208";a="12075859"
Received: from unknown (HELO [10.255.13.48]) ([10.255.13.48])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2011 10:35:22 -0700
Message-ID: <4DE6785A.9040709@intel.com>
Date: Wed, 01 Jun 2011 10:35:22 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1306866804-12443-1-git-send-email-koen@dominion.thruhere.net>
	<F501F79C-B3A9-4C49-9253-3617F466FC0A@dominion.thruhere.net>
In-Reply-To: <F501F79C-B3A9-4C49-9253-3617F466FC0A@dominion.thruhere.net>
Subject: Re: [PATCH] shadow: remove selinux entry from pam.d/login
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 17:38:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2011 02:23 AM, Koen Kooi wrote:
> This one is orthogonal to the other shadow patches by the looks of it.

That's how I see it, too.

I'll be making a v2 pull request for my user/group addition code, so if 
your patch makes it into the tree today, I will rebase to it before 
sending my next pull request.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


