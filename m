Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3192C7CF1B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 11:55:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Oct 2019 04:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="191438055"
Received: from karthik-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.38.183])
	by fmsmga007.fm.intel.com with ESMTP; 01 Oct 2019 04:55:06 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-core@lists.openembedded.org
References: <20191001095452.37335-1-git@andred.net>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <0b9696a9-bc60-f16c-2855-44d518a5f8c7@intel.com>
Date: Tue, 1 Oct 2019 12:55:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001095452.37335-1-git@andred.net>
Subject: Re: [PATCH v3 0/4] ruby recipe updates
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
X-List-Received-Date: Tue, 01 Oct 2019 11:55:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 01/10/2019 10:54, André Draszik wrote:
> This series updates the ruby recipe to:
> * remove duplicated patches
> * make it work better on musl
> * fix non-IPv6 support
> * update to v2.6.4

I spy a new ruby recipe maintainer. ;)

Thanks André!

Ross


