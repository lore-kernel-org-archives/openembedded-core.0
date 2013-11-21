Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EC0406D2FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 12:19:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Nov 2013 04:19:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,743,1378882800"; d="scan'208";a="437251345"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.225])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2013 04:19:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 21 Nov 2013 12:19:35 +0000
Message-ID: <1659524.hffL25KmdU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <528DAFF3.2070006@windriver.com>
References: <1385017169-22068-1-git-send-email-mark.hatle@windriver.com>
	<528DAFF3.2070006@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] bind: add support for read-only rootfs
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
X-List-Received-Date: Thu, 21 Nov 2013 12:19:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mark,

On Thursday 21 November 2013 01:02:11 Mark Hatle wrote:
> Sorry I forgot to add, this requires the patch that was sent to the list
> 2013-09-29 -- bind: run in the chrooted jail

... which seems to have been rejected:

http://patches.openembedded.org/patch/53845/

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

