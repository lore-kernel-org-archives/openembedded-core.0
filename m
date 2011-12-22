Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RdXCI-0004ST-0F
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 02:11:50 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 17:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99029718"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2011 17:04:40 -0800
Message-ID: <4EF28227.4060105@linux.intel.com>
Date: Wed, 21 Dec 2011 17:04:39 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: "Zhai, Edwin" <edwin.zhai@intel.com>
References: <cover.1324454963.git.edwin.zhai@intel.com>
	<bb425c648fb30fa14fe5981b5c8bba8e8cf6ba5d.1324454963.git.edwin.zhai@intel.com>
	<4EF2359E.3030904@linux.intel.com> <4EF27F54.3030603@intel.com>
In-Reply-To: <4EF27F54.3030603@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] minix-session: Add this recipe as the session file for mini X
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 01:11:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2011 04:52 PM, Zhai, Edwin wrote:
> On 12/22/2011 03:38 AM, Saul Wold wrote:
>>> diff --git a/meta/recipes-graphics/minix-session/minix-session_0.1.bb
>>> b/meta/recipes-graphics/minix-session/minix-session_0.1.bb
>>> > new file mode 100644
>>> > index 0000000..2e912c6
>>> > --- /dev/null
>>> > +++ b/meta/recipes-graphics/minix-session/minix-session_0.1.bb
>>> > @@ -0,0 +1,24 @@
>>> > +DESCRIPTION = "Mini X session files for poky"
>>> > +HOMEPAGE ="http://www.yoctoproject.org"
>>> > +BUGTRACKER ="http://bugzilla.pokylinux.org"
>>> > +
>>> > +LICENSE = "GPL"
>>> > +LIC_FILES_CHKSUM
>>> ="file://minix-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
>>> > +
>> Is this really GPL? MIT maybe?
>>
>> And if it is GPL then what version?
>
> I derived it from matchbox-session and inherited "GPL". Maybe GPLv2 is
> more reasonable?
>
Yes

> Thanks,
> Edwin
>
>>
>> Sau!
>>
>
>


