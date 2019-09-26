Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 05BE57D30C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 11:04:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2019 04:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,551,1559545200"; d="scan'208";a="364695636"
Received: from arokiasx-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.252.54.158])
	by orsmga005.jf.intel.com with ESMTP; 26 Sep 2019 04:04:42 -0700
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20190926005408.13055-1-open.source@oleksandr-kravchuk.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <865ece08-ec52-9203-207b-fe983bc59e3f@intel.com>
Date: Thu, 26 Sep 2019 12:04:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190926005408.13055-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] ell: update to 0.23
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
X-List-Received-Date: Thu, 26 Sep 2019 11:04:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 26/09/2019 01:54, Oleksandr Kravchuk wrote:
> Changelog:
> - Add support for checking if uintset is empty.
> 
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

This is in ross/mut so it won't get lost, but we're freezing for release 
so this won't be merged until 3.0 is done.

Ross


