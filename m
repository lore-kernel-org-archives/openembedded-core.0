Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9058C745AE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:01:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="53165696"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2018 05:01:18 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-9-alexander.kanavin@linux.intel.com>
	<CAMKF1sphcVNwqPgZfuK5iByfEmQ+9KuS5AwMVYsai57Shpg_xA@mail.gmail.com>
	<455508a9-e067-8025-5633-89d9e189dce6@linux.intel.com>
	<CAMKF1so8XmxWCxdOkibor+0JxV7=rikVnpsy5Aok66CPYqnUxw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5ed99aae-7705-3e49-e570-7456da9d92d1@linux.intel.com>
Date: Fri, 4 May 2018 14:55:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so8XmxWCxdOkibor+0JxV7=rikVnpsy5Aok66CPYqnUxw@mail.gmail.com>
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
X-List-Received-Date: Fri, 04 May 2018 12:01:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/30/2018 06:39 PM, Khem Raj wrote:

>>> 2.20.1 patch release is available since this patch was posted. Since
>>> this patch is still
>>> in staging, it would be nicer if it was rebased to use 2.20.1
>>
>>
>> If I need to resend the patchset, then I'll update it to catch up with
>> upstream. There's plenty of time before the next YP release.
> 
> its ok, I have done the patch I needed to do on existing version

FWIW, I have the 2.20.1 update here among many others, but I don't want 
to make the master-next/mut situation any worse, so I'm holding them 
back for now. You are welcome to cherry pick.
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates


Alex

