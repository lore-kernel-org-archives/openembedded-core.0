Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3547855C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 13:38:42 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2017 06:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,442,1496127600"; d="scan'208";a="134049671"
Received: from msanabr1-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.51.199])
	by fmsmga006.fm.intel.com with ESMTP; 31 Jul 2017 06:38:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 31 Jul 2017 15:38:41 +0200
Message-ID: <1643563.0UUDIuiVgE@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <34ee7b412201716e3c01083c9bc44e4ce8190b39.1501494496.git.liezhi.yang@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
	<34ee7b412201716e3c01083c9bc44e4ce8190b39.1501494496.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] runtime/cases/_ptest.py: revive it
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
X-List-Received-Date: Mon, 31 Jul 2017 13:38:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 31 July 2017 11:50:02 AM CEST Robert Yang wrote:
> * Will write a tool to make regression check

This commit doesn't do this and it's not completely covered by the rest of the 
series. I think you could say perhaps more appropriately "This provides data 
that could be used to detect regressions in ptest results" or similar assuming 
you need to mention it at all.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

