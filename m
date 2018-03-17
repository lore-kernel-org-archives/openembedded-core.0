Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 815E578948
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 11:23:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2018 04:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,319,1517904000"; d="scan'208";a="35813348"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 17 Mar 2018 04:23:29 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180316092126.1D843440088@auh.yoctoproject.org>
	<CAMKF1soSg4otE53o6TNE74RjQNxxFSnh3SbxLLWF9jOOdfi_2Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b0e06f76-813e-3ccb-cb65-25b1e41ebe67@linux.intel.com>
Date: Sat, 17 Mar 2018 13:16:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soSg4otE53o6TNE74RjQNxxFSnh3SbxLLWF9jOOdfi_2Q@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] Upgrade status: 2018-03-16
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
X-List-Received-Date: Sat, 17 Mar 2018 11:23:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/17/2018 01:03 AM, Khem Raj wrote:
> Glibc 2.27.9 seems not right here glibc should only track major.minor 
> for release number

Thanks, I just sent a fix for this.

Alex

