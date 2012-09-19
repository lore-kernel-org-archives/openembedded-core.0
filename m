Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TEMNw-0000JF-Jz
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:40:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2012 08:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194884950"
Received: from costin-desktop (HELO [10.237.105.66]) ([10.237.105.66])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2012 08:27:37 -0700
Message-ID: <5059D79C.8060703@intel.com>
Date: Wed, 19 Sep 2012 17:33:00 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1348048754-30379-1-git-send-email-constantinx.musca@intel.com>
	<CAMKF1spysZ_tcHRu1XoTTdvvMCbSxfjkJnk6xgg1KU_Hm__DBQ@mail.gmail.com>
	<5059C2CE.4050109@intel.com> <5059E042.3050805@linux.intel.com>
	<CAJTo0LaB862PyJ8VGCJgLVCqb9A0=AZf43fztWjQOPMUuki-5Q@mail.gmail.com>
In-Reply-To: <CAJTo0LaB862PyJ8VGCJgLVCqb9A0=AZf43fztWjQOPMUuki-5Q@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] intltool: include intltool.m4 and add missing rdepends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 15:40:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2012 06:15 PM, Burton, Ross wrote:
> On 19 September 2012 16:09, Saul Wold <sgw@linux.intel.com> wrote:
>> The question here is why do we need the gettext-dev package for intltool?
>> What does intltool need from the -dev package?
> intltool needs the gettext binaries and IIRC a header - but I'm
> sufficiently unsure about the details that someone should verify what
> the dependencies were for documenting in the commit.
>
> Ross
I'm going to investigate this and come back to you.

Constantin


