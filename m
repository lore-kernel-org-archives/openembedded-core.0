Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E9EA160130
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:45:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2013 08:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,891,1371106800"; d="scan'208";a="394807742"
Received: from unknown (HELO [10.255.14.99]) ([10.255.14.99])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2013 08:45:20 -0700
Message-ID: <5231E18F.7080301@linux.intel.com>
Date: Thu, 12 Sep 2013 08:45:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Rongqing Li <rongqing.li@windriver.com>
References: <cover.1378276893.git.rongqing.li@windriver.com>
	<523105FE.3070904@windriver.com>
In-Reply-To: <523105FE.3070904@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] make runlevel to return correct value
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
X-List-Received-Date: Thu, 12 Sep 2013 15:45:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2013 05:08 PM, Rongqing Li wrote:
> ping...
>
You replied to your patch question if it was right, therefore I put this 
off expecting an updated patchset.

Or are you asking about 2/2?

Sau!

> -Roy
>
> On 09/04/2013 02:56 PM, rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> The following changes since commit
>> 8c272641ef3e8410f331ca4133d28dea8f36e4f4:
>>
>>    lib/oeqa/runtime: smart: serve repo on host ip only and increase
>> timeout (2013-09-03 19:57:31 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib roy/systemd-1
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/systemd-1
>>
>> Roy.Li (2):
>>    systemd-compat-units: do not create runlevel command
>>    systemd: link runlevel from systemctl
>>
>>   meta/recipes-core/systemd/systemd-compat-units.bb |    5 -----
>>   meta/recipes-core/systemd/systemd_206.bb          |    6 +++++-
>>   2 files changed, 5 insertions(+), 6 deletions(-)
>>
>

