Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id A8E447FC83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 00:00:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 16:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="264397088"
Received: from pozo-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.212])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2019 16:00:38 -0800
To: openembedded-core@lists.openembedded.org
References: <20191207231134.27610-1-bunk@stusta.de>
	<20191209151709.GD5701@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <0cb9d57e-532b-957a-5456-fc20dbf7a85f@intel.com>
Date: Tue, 10 Dec 2019 00:00:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209151709.GD5701@localhost>
Subject: Re: [PATCH v3] python/python3: Whitelist CVE-2019-18348
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
X-List-Received-Date: Tue, 10 Dec 2019 00:00:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 09/12/2019 15:17, Adrian Bunk wrote:
> Please apply, v2 was already on master-next at some point but this
> change has some trivial context overlap with the Python 3.7->3.8
> upgrade so v2 was dropped when 3.8 was dropped.

Rebased this morning and queued again in ross/mut.

Ross

