Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id AE7237E53E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 11:19:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 04:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="218592274"
Received: from creinhar-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.39.119])
	by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2019 04:19:04 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1569306585.git.liezhi.yang@windriver.com>
	<727575983e43ad186b2f36209b306bdf37b07c4d.1569306585.git.liezhi.yang@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <64c71c1a-56ec-fab9-5f66-20ae35fdc59a@intel.com>
Date: Tue, 24 Sep 2019 12:19:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <727575983e43ad186b2f36209b306bdf37b07c4d.1569306585.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] expect: Fix buffer overflow error when build in long path
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
X-List-Received-Date: Tue, 24 Sep 2019 11:19:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 24/09/2019 08:34, Robert Yang wrote:
> +Upstream-Status: Pending [Upstream seems dead]

The web site says to use SourceForge, but that's wrong.  The code is 
(sort of) alive in Fossil at https://core.tcl-lang.org/expect/home so 
please do submit the patch to either their SF or the Fossil instance.

Ross

