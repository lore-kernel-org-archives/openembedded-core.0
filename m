Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tri6T-0008Ri-4m
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 05:45:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2013 20:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,418,1355126400"; d="scan'208";a="188123027"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jan 2013 20:29:48 -0800
Message-ID: <50E8FDBB.5080500@linux.intel.com>
Date: Sat, 05 Jan 2013 20:29:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
In-Reply-To: <CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Sun, 06 Jan 2013 04:45:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2013 10:52 PM, Marko Lindqvist wrote:
> On 5 January 2013 08:22, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> Saul Wold (3):
>>    glib-2.0: Update to 2.35.3
>
>   Is there some specific need for bleeding edge (unstable development snapshot)?
>
I was updating glib-networking and it required glib 2.35.3, I had not 
checked (my bad that it was unstable).  Even after a number of years, I 
loose track sometimes of what's stable vs unstable (odd vs .99 vs ??)

We can drop both the glib and glib-networking patches.


Sau!

>
>
>   - ML
>


