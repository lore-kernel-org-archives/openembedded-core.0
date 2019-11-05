Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 92BBE7F959
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 10:42:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Nov 2019 02:42:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; d="scan'208";a="353111148"
Received: from sptommas-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.55.33])
	by orsmga004.jf.intel.com with ESMTP; 05 Nov 2019 02:42:58 -0800
To: openembedded-core@lists.openembedded.org
References: <20191105063817.243431-1-hongxu.jia@windriver.com>
	<20191105071049.104644-1-hongxu.jia@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1a91aa6c-a9a3-b668-d327-95ba1dfb1656@intel.com>
Date: Tue, 5 Nov 2019 10:42:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105071049.104644-1-hongxu.jia@windriver.com>
Subject: Re: [PATCH V2] go: fix CVE-2019-17596
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
X-List-Received-Date: Tue, 05 Nov 2019 10:42:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/11/2019 07:10, Hongxu Jia wrote:
> https://github.com/golang/go/commit/2017d88dbc096381d4f348d2fb08bfb3c2b7ed73

There's a go 1.13 upgrade on the list that is queued in mut.  Does this 
apply to 1.13 or does that already contain this fix?

Ross

