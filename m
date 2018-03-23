Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E6A4478557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 15:03:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2018 08:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,350,1517904000"; d="scan'208";a="44725155"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2018 08:03:13 -0700
To: "Burton, Ross" <ross.burton@intel.com>, akuster808 <akuster808@gmail.com>
References: <1521781486-20919-1-git-send-email-akuster808@gmail.com>
	<CAMKF1sreT7Pm9k7C74S7JggUOA7i52YefxoGGKyq5HhOkspaew@mail.gmail.com>
	<bcd2bae7-cbfb-8fbf-8a24-458d2c10d6fc@gmail.com>
	<CAJTo0Laa5a=KcaurORaN=nYXO8T5LZWJUAQpt=o9Z-doP9o=ng@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a582a169-310b-c51e-fece-4900b5f5a664@linux.intel.com>
Date: Fri, 23 Mar 2018 16:56:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Laa5a=KcaurORaN=nYXO8T5LZWJUAQpt=o9Z-doP9o=ng@mail.gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][v2][PATCH] distcc: Change SRC_URI
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
X-List-Received-Date: Fri, 23 Mar 2018 15:03:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/23/2018 04:31 PM, Burton, Ross wrote:
> So many questions.
> 
> What did we ship?  Why doesn't it exist upstream anymore?
> 
> Shipping a fork in a personal repo sounds like a good solution for the
> stable branches following the principle of least surprise: they're
> shipping what they always did.  For master/2.5 though, I'm not happy
> about it (but will pull this in for now to get it building again).
> 

We might yet get a functional 3.3 upgrade for master in time for 2.5?

Alex

