Return-Path: <nitin.a.kamble@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BA56F70E26
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 22:29:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 15 Aug 2014 15:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="373010217"
Received: from vkhane-mobl.amr.corp.intel.com (HELO [10.255.73.226])
	([10.255.73.226])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2014 15:26:21 -0700
Message-ID: <53EE89DE.2060507@intel.com>
Date: Fri, 15 Aug 2014 15:29:50 -0700
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Organization: Intel Corp
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, 
	Openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
References: <cover.1408131949.git.nitin.a.kamble@intel.com>
	<f7005d8cdc8350910287333d533876982d613836.1408131949.git.nitin.a.kamble@intel.com>
	<53EE6FD6.50809@linux.intel.com>
In-Reply-To: <53EE6FD6.50809@linux.intel.com>
Subject: Re: [PATCH 1/1] grub_2.00: strip the sparc64 files from building
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
X-List-Received-Date: Fri, 15 Aug 2014 22:30:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 8/15/2014 1:38 PM, Saul Wold wrote:
>> -PR = "r1"
>> +PR = "r2"
>>
> You don't need the PR bump anymore, just leave it set to r1
>
> Sau!
>
OK, I have update the commit in the contrib branch with PR = r1.


Nitin


