Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id CE05B6E8FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 10:10:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2014 02:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,778,1384329600"; d="scan'208";a="469574333"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.79])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2014 02:10:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Tue, 04 Feb 2014 10:10:19 +0000
Message-ID: <1521180.2sXy9KK50E@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <52F0ABC7.1010908@linaro.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
	<1390316993.874.85.camel@ted> <52F0ABC7.1010908@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Tue, 04 Feb 2014 10:10:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 04 February 2014 09:58:47 Koen Kooi wrote:
> What's the status on this? I know a fix went into meta-intel (albeit it
> in a legally questionable way, but that's their problem) and the other
> affected layers have received patches for it.

Legally questionable in what way? If you refer to your name being removed from 
the patch, that was rectified before the patch was merged.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

