Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAMUE-00034c-NG
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 16:30:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2013 07:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,740,1355126400"; d="scan'208";a="267876718"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2013 07:14:12 -0800
Message-ID: <512CD144.4030308@linux.intel.com>
Date: Tue, 26 Feb 2013 07:14:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Cristian Iorga <cristian.iorga@intel.com>
References: <1361782141-18273-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16205C3C@IRSMSX102.ger.corp.intel.com>
	<512BF975.90206@linux.intel.com>
	<512C7F88.8030907@communistcode.co.uk>
	<969F26A8BAB325438E7EB80D3C3134FB162063D2@IRSMSX102.ger.corp.intel.com>
	<512C981C.3090001@communistcode.co.uk>
	<CAJTo0LZ3c-nS109EJvSJbJvYkTPK-gr2OS_jGweNd36tEybQjg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ3c-nS109EJvSJbJvYkTPK-gr2OS_jGweNd36tEybQjg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] connman: enable connman client
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
X-List-Received-Date: Tue, 26 Feb 2013 15:30:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2013 03:16 AM, Burton, Ross wrote:
> On 26 February 2013 11:10, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> I think it is best to be defined as a separate package connman-client within
>> the current connman recipe. My reasoning for this is that connman is widely
>> used as an embedded network manager and its main interface is dbus rather
>> than the 'helper' program connmanctl.
>
+1 to connman-client

> Cristian - in another commit can you also add connman-client to the
> tools-testapps image feature?
>
+1 here also!

Sau!

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


