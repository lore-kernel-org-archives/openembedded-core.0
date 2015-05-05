Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3D76D72376
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 13:37:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2015 06:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,372,1427785200"; d="scan'208";a="489593934"
Received: from jashore-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.219])
	by FMSMGA003.fm.intel.com with ESMTP; 05 May 2015 06:37:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 05 May 2015 14:37:23 +0100
Message-ID: <1762023.DLBfWrMxP5@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.6 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <CAJTo0LYPCxdbcKkpJnBhW4ecrAdyPvOURaB6PLLoLWCB_Q-wcA@mail.gmail.com>
References: <1430828220-14251-1-git-send-email-ross.burton@intel.com>
	<CAJTo0LYPCxdbcKkpJnBhW4ecrAdyPvOURaB6PLLoLWCB_Q-wcA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] poky.conf: remove SVK mirror
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
X-List-Received-Date: Tue, 05 May 2015 13:37:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ross,

On Tuesday 05 May 2015 13:21:26 Burton, Ross wrote:
> Sorry, my fingers typing on their own, re-sending to the right list now...

Presumably we'd want to get rid of the svk:// URIs in mirrors.bbclass and own-
mirrors.bbclass in OE-Core though?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

