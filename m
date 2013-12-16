Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 743C06DD22;
	Mon, 16 Dec 2013 20:09:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2013 12:05:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,496,1384329600"; d="scan'208";a="453172814"
Received: from unknown (HELO [10.255.15.128]) ([10.255.15.128])
	by orsmga002.jf.intel.com with ESMTP; 16 Dec 2013 12:08:52 -0800
Message-ID: <52AF5DD4.2090307@linux.intel.com>
Date: Mon, 16 Dec 2013 12:08:52 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMKF1spWnFvXRAp-GuoBL9vXceg29h5Numv7PYhZNWUJu8rMRw@mail.gmail.com>
In-Reply-To: <CAMKF1spWnFvXRAp-GuoBL9vXceg29h5Numv7PYhZNWUJu8rMRw@mail.gmail.com>
Subject: Re: [RFC] Binutils upgrade to 2.24
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
X-List-Received-Date: Mon, 16 Dec 2013 20:09:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2013 12:03 PM, Khem Raj wrote:
> Hi
>
> I have pushed a contrib branch for binutils 2.24 upgrade here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.24
>
> I have tested it on both uclibc/eglibc and qemu machines. But it would
> be nice if
> it gets more testing for machines I havent tested
>
I will throw it into the next MUT build for you.

What's going on with the Python3 patches?

Sau!

> Thanks
>
> -Khem
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

