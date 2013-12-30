Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 129DC60C16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 13:03:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2013 05:03:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,573,1384329600"; d="scan'208";a="459388913"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.78])
	by orsmga002.jf.intel.com with ESMTP; 30 Dec 2013 05:03:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "a.renault@kaptalia.com" <a.renault@kaptalia.com>
Date: Mon, 30 Dec 2013 13:03:13 +0000
Message-ID: <7271841.jxscSydvqV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1550216.XXvskmQOuT@linux-krvt.site>
References: <1550216.XXvskmQOuT@linux-krvt.site>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: networkmanager_0.9.8.bb
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
X-List-Received-Date: Mon, 30 Dec 2013 13:03:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Adrien,

On Monday 30 December 2013 12:16:04 a.renault@kaptalia.com wrote:
> I want to propose a modification : --without-systemdsystemunitdir= -> --
> without-systemdsystemunitdir on networkmanager_0.9.8.0.bb, this file is
> available on meta-openembedded/meta-oe/recipes-
> connectivity/networkmanager/networkmanager_0.9.8.0.bb

This recipe is part of meta-oe rather than OE-Core, so discussion/patches 
about it should go there instead.

If you could send the patch using the method documented here that would be 
much appreciated:

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

