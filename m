Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CCEE365EB8;
	Mon, 28 Apr 2014 10:11:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2014 03:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,943,1389772800"; d="scan'208";a="502197726"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.52])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2014 03:10:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Mon, 28 Apr 2014 11:10:35 +0100
Message-ID: <1874660.NNkBdmWv1O@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
MIME-Version: 1.0
Subject: OE Github repositories
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
X-List-Received-Date: Mon, 28 Apr 2014 10:11:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks,

Could whoever has admin access for the OpenEmbedded repositories on github 
please do two things:

1) Stop having both "oe-core" and "openembedded-core" repositories - the 
latter is four months out-of-date. I'd suggest if we want to be consistent 
with our openembedded.org repos we should keep the "openembedded-core" 
repository and make it so it is kept up-to-date.

2) Rename the "meta-oe" repository to "meta-openembedded", since meta-oe the 
layer is distinct from meta-openembedded the repository, and again this would 
be consistent with the primary repository naming.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

