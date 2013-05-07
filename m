Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UZn0m-0004m3-2s
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 20:53:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r47IZDac021829
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 11:35:13 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 7 May 2013 11:35:12 -0700
Message-ID: <51894960.6070406@windriver.com>
Date: Tue, 7 May 2013 13:35:12 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>
References: <51892728.3090609@farnsworthtech.com>
	<51892D8A.5030806@windriver.com>
	<51893B46.3090205@farnsworthtech.com>
	<51893CB4.9070304@windriver.com>
	<CAHUNapRP6SbJVhQey907pHg+X+tosP-86D_5gBs=Vkt4MPBN+w@mail.gmail.com>
In-Reply-To: <CAHUNapRP6SbJVhQey907pHg+X+tosP-86D_5gBs=Vkt4MPBN+w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: SDK meta-toolchain
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
X-List-Received-Date: Tue, 07 May 2013 18:53:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/13 1:21 PM, Trevor Woerner wrote:
> On Tue, May 7, 2013 at 1:41 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> - nativesdk -- runs on the 'sdkhost' (variant called 'crosssdk')
>
> Is this related to the SDKMACHINE setting?
>

Yes that's the variable I was thinking of.  You can build an SDK for 'i586' on 
your x86_64 host for instance.

--Mark


