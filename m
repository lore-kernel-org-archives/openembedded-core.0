Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D826F6E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 08:41:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 24 Apr 2015 01:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,638,1422950400"; d="scan'208";a="684971504"
Received: from jevens-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.46])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2015 01:41:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Apr 2015 09:41 +0100
Message-ID: <2497829.JAgkNRbGla@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <D15FDB62.4EB39%markus.lehtonen@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
	<c1dd117694b4df1c77bac677d00dba392f3f7487.1429805738.git.paul.eggleton@linux.intel.com>
	<D15FDB62.4EB39%markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 4/8] devtool: extract: remove patches when S=WORKDIR
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
X-List-Received-Date: Fri, 24 Apr 2015 08:41:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 24 April 2015 11:38:45 Markus Lehtonen wrote:
> NACK! Please skip this patch for now. I just found out it doesn't work as
> expected. I'll submit a new version when I've worked around the problems.

OK, I've re-pushed the branch with this patch removed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

