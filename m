Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 95C9271A15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 21:23:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 18 Oct 2016 14:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,511,1473145200"; d="scan'208";a="1046616266"
Received: from yuan-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.98])
	by orsmga001.jf.intel.com with ESMTP; 18 Oct 2016 14:23:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Date: Wed, 19 Oct 2016 10:23:03 +1300
Message-ID: <3151643.dXW46sbQpQ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.7-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1476807792-16431-1-git-send-email-juro.bystricky@intel.com>
References: <1476807792-16431-1-git-send-email-juro.bystricky@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] insane.bbclass: Additional "mips" and "mipsel" machine definitions
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
X-List-Received-Date: Tue, 18 Oct 2016 21:23:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 18 Oct 2016 09:23:12 Juro Bystricky wrote:
> Add "mips" and "mipsel" to "machdata" table.
> Although there is a way to add entries to the "machdata" table
> from a BSP without modifying the insane.bbclass directly, MIPS is
> already supported in openembedded-core and as such the relevant entries
> should be present in insane.bbclass.

It seems v1 was already merged I'm afraid.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

