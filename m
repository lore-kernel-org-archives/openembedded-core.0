Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA90600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 13:13:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Apr 2018 06:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,346,1520924400"; d="scan'208";a="47156627"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 30 Apr 2018 06:13:36 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-9-alexander.kanavin@linux.intel.com>
	<CAMKF1sphcVNwqPgZfuK5iByfEmQ+9KuS5AwMVYsai57Shpg_xA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <455508a9-e067-8025-5633-89d9e189dce6@linux.intel.com>
Date: Mon, 30 Apr 2018 16:07:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sphcVNwqPgZfuK5iByfEmQ+9KuS5AwMVYsai57Shpg_xA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/22] webkitgtk: update to 2.20.0
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
X-List-Received-Date: Mon, 30 Apr 2018 13:13:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/30/2018 03:43 AM, Khem Raj wrote:
> On Wed, Apr 4, 2018 at 4:13 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> Rebase patches, remove a couple of upstreamed patches.
>>
>> Add an option to enable woff2 font library (not currently packaged by oe).
>>
> 
> 2.20.1 patch release is available since this patch was posted. Since
> this patch is still
> in staging, it would be nicer if it was rebased to use 2.20.1

If I need to resend the patchset, then I'll update it to catch up with 
upstream. There's plenty of time before the next YP release.

Alex


