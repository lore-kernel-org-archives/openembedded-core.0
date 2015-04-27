Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B378365CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:42:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2015 03:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,656,1422950400"; d="scan'208";a="719776045"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2015 03:42:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2015 11:42:45 +0100
Message-ID: <1798943.LKR0anCYiA@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1429911519-26068-1-git-send-email-akuster808@gmail.com>
References: <1429911519-26068-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] tzcode: update to 2014d
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
X-List-Received-Date: Mon, 27 Apr 2015 10:42:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 24 April 2015 14:38:38 Armin Kuster wrote:
> Changes affecting code
> 
>     zic has some minor performance improvements.
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-extended/tzcode/tzcode-native_2015c.bb | 11 -----------
>  meta/recipes-extended/tzcode/tzcode-native_2015d.bb | 11 +++++++++++

Typo in shortlog (2014->2015).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

