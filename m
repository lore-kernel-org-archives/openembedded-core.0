Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 712E17F473
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:49:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2019 03:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="185956437"
Received: from ambachan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.33.220])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2019 03:49:46 -0700
To: openembedded-core@lists.openembedded.org
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<8d33f7f60b0fb8394b459ed4c43e9f21d844b269.camel@linuxfoundation.org>
	<CANNYZj83RCwo3mtTkRxnyN45pi4qCg5ifrihWcyhQuk+0arZxA@mail.gmail.com>
	<3053753.Zs8syfq2pI@localhost.localdomain>
	<CANNYZj9aqA-7uWBNHCYzc1OKtnki1w-P3mGEePG=EsYOEf5kzA@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c72db6d1-d0ff-f3b6-fb9f-e1e8c526f9c0@intel.com>
Date: Wed, 7 Aug 2019 11:49:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9aqA-7uWBNHCYzc1OKtnki1w-P3mGEePG=EsYOEf5kzA@mail.gmail.com>
Subject: Re: [PATCH 5/9] python-setuptools: update to 41.0.1
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
X-List-Received-Date: Wed, 07 Aug 2019 10:49:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/08/2019 11:22, Alexander Kanavin wrote:
> On Wed, 7 Aug 2019 at 01:14, Paul Eggleton 
> <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>> 
> wrote:
> 
> 
>     Did you get anywhere with this?
> 
>     FYI I filed a bug for the issue:
> 
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=13467
> 
> 
> Yes, it is already fixed in master:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=ac5b7cef596114ec96fcff34a3251ebf959395fd

Good find.  I tried, and failed, to reproduce this in thud.

Ross

