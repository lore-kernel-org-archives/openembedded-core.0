Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RLTld-0006tD-9V
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 06:53:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA25lX36025076
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Nov 2011 22:47:33 -0700 (PDT)
Received: from [128.224.162.191] (128.224.162.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 1 Nov 2011 22:47:33 -0700
Message-ID: <4EB0D993.60801@windriver.com>
Date: Wed, 2 Nov 2011 13:48:03 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1319510805.git.wenzong.fan@windriver.com>
	<4EB0909C.5020202@intel.com>
In-Reply-To: <4EB0909C.5020202@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Wed, 02 Nov 2011 05:53:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2011 08:36 AM, Saul Wold wrote:
> On 10/24/2011 07:49 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> Update distro tracking fields for ccache, chkconfig.
>>
>> The following changes since commit 
>> 53ee27a1c5b589cba874f674c428e1a36557cc3b:
>>    Joshua Lock (1):
>>          doc: update manual for checksum changes
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib 
>> wenzong/distro_tracking_fields_update
>>    
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/distro_tracking_fields_update 
>>
>>
>> Wenzong Fan (1):
>>    distro_tracking_fields: update packages tracking fields
>>
>>   .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
>>   1 files changed, 12 insertions(+), 0 deletions(-)
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> This got pulled, but I still need a fix for Month format to MMM please

Fixed, please see another PR whcih with subject "distro_tracking_fields: 
Update the Month to 'MMM'".

Thanks
Wenzong
>
> Thanks
>     Sau!
>
>



