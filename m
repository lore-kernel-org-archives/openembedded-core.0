Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD4A74BBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 14:06:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2018 07:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,415,1520924400"; d="scan'208";a="55547293"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 18 May 2018 07:06:43 -0700
To: Marek Vasut <marek.vasut@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <20180517021314.0C556440002@auh.yoctoproject.org>
	<b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
	<CAJTo0LZZyB+uHpECahdUZXA0v2ujGu0eo2TTHhnutY5EJiQegQ@mail.gmail.com>
	<3fab3122-1ddd-d70a-2d3f-00a1e436be4b@linux.intel.com>
	<8c49ac0d-e52e-505b-d6c2-688ca7b3fb6e@gmail.com>
	<0df38331-afdf-b47c-410e-6640c74e8b14@linux.intel.com>
	<b791ecd2-619b-ab33-b474-e2d7630eb80d@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5870da79-7c81-fcd2-0524-a6e610c00956@linux.intel.com>
Date: Fri, 18 May 2018 17:06:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <b791ecd2-619b-ab33-b474-e2d7630eb80d@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.05 FAILED
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
X-List-Received-Date: Fri, 18 May 2018 14:06:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/18/2018 12:20 AM, Marek Vasut wrote:

> Let's see how this works:
> https://patchwork.ozlabs.org/patch/915781/
> 
> Once this gets mainline, we should then be able to enable u-boot for
> qemux86/qemux86-64 . I have a patch ready for that too, but let's wait
> until the U-Boot patch discussion is over.

Thanks :)

Alex

