Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E7AF87881B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:56:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 03:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,310,1517904000"; d="scan'208";a="35222477"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 15 Mar 2018 03:56:42 -0700
To: openembedded-core@lists.openembedded.org
References: <c1fcdce0-7ad4-d7ce-287b-3783579fc631@yahoo.com>
	<8ef4b697-ea48-80eb-9068-7b15fd7cc944@yahoo.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ff44760a-886b-b868-c309-3cf52dc142f5@linux.intel.com>
Date: Thu, 15 Mar 2018 12:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <8ef4b697-ea48-80eb-9068-7b15fd7cc944@yahoo.com>
Subject: Re: Recipe for Linux page-types tool
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
X-List-Received-Date: Thu, 15 Mar 2018 10:56:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/15/2018 12:20 AM, Martin Vuille wrote:
> page-types is a simple Linux kernel debugging tool to list information 
> about
> the state of virtual memory (VM) pages.
> 
> The source is distributed as part of the kernel tree: tools/vm/page-types.c
> 
> MV
> 
> On 03/14/18 11:22, Martin Vuille wrote:
>> I have a recipe for building the page-types Linux kernel VM tool.
>> Is there any interest in this?
>> If so, to what project/layer should I send it?


This questions is probably better asked on the linux-yocto mailing list 
then?

Alex

