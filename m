Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 29205901C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 11:51:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Sep 2019 04:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,520,1559545200"; d="scan'208";a="211830344"
Received: from abloeckn-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.38.226])
	by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2019 04:51:04 -0700
To: openembedded-core@lists.openembedded.org
References: <20190918111225.29068-1-daniel.ammann@bytesatwork.ch>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <58ec63ee-fa32-cf5e-1a44-0298f4bb077d@intel.com>
Date: Wed, 18 Sep 2019 12:51:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918111225.29068-1-daniel.ammann@bytesatwork.ch>
Subject: Re: [PATCH] dhex: Add new recipe
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
X-List-Received-Date: Wed, 18 Sep 2019 11:51:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 18/09/2019 12:12, Daniel Ammann wrote:
> +SUMMARY = "dhex is a hex editor that includes a diff mode"

Doesn't seem fundamental enough to justify being in oe-core, please 
considering submitting this to meta-oe instead.

Ross

