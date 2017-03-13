Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1D24272F46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 13:19:33 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 06:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,159,1486454400"; d="scan'208";a="75987849"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2017 06:19:33 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<b6d2b654a601d53ea4168c2f8d6438ac7be5e10d.1489144807.git.alexander.kanavin@linux.intel.com>
	<2fbc77bf-fbe0-2673-3af7-e95c0e5e2a4e@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a27b3883-7d69-0e61-351a-8b19aaf3255c@linux.intel.com>
Date: Mon, 13 Mar 2017 15:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <2fbc77bf-fbe0-2673-3af7-e95c0e5e2a4e@windriver.com>
Subject: Re: [PATCH 30/44] byacc: remove the recipe
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
X-List-Received-Date: Mon, 13 Mar 2017 13:19:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2017 06:37 PM, Mark Hatle wrote:
> byacc, until recently, was required by the LSB / LSB Test Suite.
>
> So I'd rather is be kept in oe-core through the 2.3 release.

I couldn't find it in the LSB 5 standard. Is it something from earlier 
versions?

Alex


