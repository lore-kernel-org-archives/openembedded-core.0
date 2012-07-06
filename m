Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SnCQl-0002yf-5T
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 19:34:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jul 2012 10:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="189290143"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2012 10:23:52 -0700
Message-ID: <4FF71F28.70302@linux.intel.com>
Date: Fri, 06 Jul 2012 10:23:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
	<4FF453EC.8030007@linux.intel.com> <1341413143.3906.31.camel@ted>
	<CAJ2CSBuRsmRDCaj5oY8xToURc3GkCJzRj8y6auzTUxA32AZBMQ@mail.gmail.com>
	<1341414137.3906.33.camel@ted>
	<CAJ2CSBtESa4NVB1YF_VSN3BOj-n8NipPN7krkuLHH-nRdEVfcg@mail.gmail.com>
	<20120704152111.GB15100@jama.jama.net>
	<CAJ2CSBvQJtFPBXf-QEVm7bO84W4_K2ziYAOR=1kiQfENyK_D_Q@mail.gmail.com>
	<4FF5F32C.7080905@gmail.com> <1341564942.3104.3.camel@ted>
	<CAMKF1so=LN+cXK37B9Eu1msE-kmVUJDkSzvcCLm9jSFNDaZM_w@mail.gmail.com>
In-Reply-To: <CAMKF1so=LN+cXK37B9Eu1msE-kmVUJDkSzvcCLm9jSFNDaZM_w@mail.gmail.com>
Subject: Re: gcc errors while building core-image-sato-sdk
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
X-List-Received-Date: Fri, 06 Jul 2012 17:34:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2012 09:00 AM, Khem Raj wrote:
> On Fri, Jul 6, 2012 at 1:55 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> I merged a couple of gcc changes fairly quickly to address a variety of
>> problems people started hitting (including the autobuilder). The svn
>> nature of the recipe is causing a few issues with the subversion 1.7
>> change. I am wondering if we should just point it to the svn checkout
>> tarball by default and leave the svn url for use when updating only and
>> populating the mirror?
>
> or we can use git instead of svn. http://gcc.gnu.org/git/?p=gcc.git
>
That sounds like a good idea.

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



