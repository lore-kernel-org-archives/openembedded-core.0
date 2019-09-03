Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 37EC87F323
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 09:17:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Sep 2019 02:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,462,1559545200"; d="scan'208";a="382057950"
Received: from oakcakay-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.252.38.52])
	by fmsmga005.fm.intel.com with ESMTP; 03 Sep 2019 02:16:59 -0700
To: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
References: <1566545188-273512-1-git-send-email-zhe.he@windriver.com>
	<bb110de5-6c32-f845-1915-ad815adfcce2@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <e1231c6d-05a3-ee79-c494-a8634d25d51b@intel.com>
Date: Tue, 3 Sep 2019 10:16:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bb110de5-6c32-f845-1915-ad815adfcce2@windriver.com>
Subject: Re: [PATCH] ltp: syscalls: rt_sigwaitinfo01: Fix failure for MIPS arches
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
X-List-Received-Date: Tue, 03 Sep 2019 09:17:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 03/09/2019 08:55, He Zhe wrote:
> Kindly ping.

This doesn't apply to current master, can you please rebase?

Ross

