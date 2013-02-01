Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1U15Zr-0000XV-74
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 02:38:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r111MHvw022955
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Jan 2013 17:22:17 -0800 (PST)
Received: from [128.224.162.133] (128.224.162.133) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 31 Jan 2013 17:22:16 -0800
Message-ID: <510B18C5.2080404@windriver.com>
Date: Fri, 1 Feb 2013 09:22:13 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1359625578-26968-1-git-send-email-ming.liu@windriver.com>
	<1359637195.14071.29.camel@ted>
In-Reply-To: <1359637195.14071.29.camel@ted>
X-Originating-IP: [128.224.162.133]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman-gnome: Add DEPENDS on intltool-native
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
X-List-Received-Date: Fri, 01 Feb 2013 01:38:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/31/2013 08:59 PM, Richard Purdie wrote:
> On Thu, 2013-01-31 at 17:46 +0800, Ming Liu wrote:
>> [YOCTO #3815]
>> [ CQID: WIND00401118 ]
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> This commit description isn't enough, please summarise bug 3815 in the
> commit message.

ok, thx for the review.
I will add it into commit message and send the V1 soon.

the best,
thank you

>
> Cheers,
>
> Richard
>
>
>



