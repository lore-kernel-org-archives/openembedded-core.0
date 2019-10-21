Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 4285C7F4C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 16:50:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Oct 2019 09:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,324,1566889200"; d="scan'208";a="209393105"
Received: from adahiya-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.249.39.45])
	by orsmga002.jf.intel.com with ESMTP; 21 Oct 2019 09:50:25 -0700
To: openembedded-core@lists.openembedded.org
References: <b8921ea9bc7bad48a33b0a818d47e2ea069a1dc6.camel@linuxfoundation.org>
	<db51470b-812f-d60d-b9e9-7741c536f3e2@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <3caed9f1-e9cf-662b-cf27-876bcab01f9e@intel.com>
Date: Mon, 21 Oct 2019 17:50:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <db51470b-812f-d60d-b9e9-7741c536f3e2@gmail.com>
Subject: Re: Help with intermittent autobuilder exposed bugs
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
X-List-Received-Date: Mon, 21 Oct 2019 16:50:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 20/10/2019 16:54, akuster808 wrote:
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/440
>> oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
>> [no open bug?, fedora specific perldoc reproducibility issue]
> Think its the same as
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13602

Filed as https://bugzilla.yoctoproject.org/show_bug.cgi?id=13606.

Ross

