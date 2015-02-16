Return-Path: <oleg.zhurakivskyy@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BC362606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 09:09:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Feb 2015 01:05:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,586,1418112000"; d="scan'208";a="652701750"
Received: from ozhuraki.fi.intel.com (HELO [10.237.67.143]) ([10.237.67.143])
	by orsmga001.jf.intel.com with ESMTP; 16 Feb 2015 01:09:36 -0800
Message-ID: <54E1B3CF.2050908@intel.com>
Date: Mon, 16 Feb 2015 11:09:35 +0200
From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1423746097-4198-1-git-send-email-oleg.zhurakivskyy@intel.com>
	<CAJTo0LasPzPxnq4Sv9CdR_OXuPxZiPhJNd2z7PxWjwxH50Mv-g@mail.gmail.com>
In-Reply-To: <CAJTo0LasPzPxnq4Sv9CdR_OXuPxZiPhJNd2z7PxWjwxH50Mv-g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add libedit, neardal recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Feb 2015 09:09:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

On 02/13/2015 06:53 PM, Burton, Ross wrote:
> As nothing else in oe-core needs there right now, I'd suggest that neardal should be in meta-connectivity and libedit is already in meta-oe (https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb) alebit an older release so an upgrade patch would be welcome.

Thanks for pointing these out, I will correct both.

Just to make sure I understood correctly regarding meta-connectivity, is that meta-oe/recipes-connectivity?

Thanks in advance!

Regards,
Oleg


