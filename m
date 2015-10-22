Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 94D6675F3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 08:39:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Oct 2015 01:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,181,1444719600"; d="scan'208";a="800007931"
Received: from brink-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.117])
	by orsmga001.jf.intel.com with ESMTP; 22 Oct 2015 01:39:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 22 Oct 2015 09:39:20 +0100
Message-ID: <1592752.xDqxo6mcG7@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <alpine.LFD.2.20.1510220413020.4613@localhost>
References: <alpine.LFD.2.20.1510220413020.4613@localhost>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: why does local.conf.sample not mention qemumips64?
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
X-List-Received-Date: Thu, 22 Oct 2015 08:39:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 October 2015 04:14:15 Robert P. J. Day wrote:
>   not sure i asked this once upon a time but since the OE layer
> contains a machine definition for qemumips64, why doesn't
> local.conf.sample contain a sample line for that? just curious.

I don't think it's intentional, more likely an oversight. Could you send a 
patch to add it?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

