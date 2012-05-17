Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SV64E-0006t7-Ae
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 21:08:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4HIwoAE007598
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 11:58:51 -0700 (PDT)
Received: from msp-dhcp29.wrs.com (172.25.34.29) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 17 May 2012 11:58:50 -0700
Message-ID: <4FB54A6A.4060800@windriver.com>
Date: Thu, 17 May 2012 13:58:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1337278931.git.mark.hatle@windriver.com>
	<6152dc105c0eecec81a65b329a3a5a0820eeed26.1337278931.git.mark.hatle@windriver.com>
	<CAMKF1sofgso3eS-AuwFMHh+DBhqgThi6PVDvepeyyaqQW_r7JA@mail.gmail.com>
	<4FB54847.5020102@windriver.com>
	<CAMKF1srxfiTgKUKxpZCcQo-SZQtomOHTouUkV3CNWuYdVtWKdg@mail.gmail.com>
In-Reply-To: <CAMKF1srxfiTgKUKxpZCcQo-SZQtomOHTouUkV3CNWuYdVtWKdg@mail.gmail.com>
Subject: Re: [PATCH 1/4] rpm: Upgrade RPM to 5.4.8 (db to 5.3.15)
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
X-List-Received-Date: Thu, 17 May 2012 19:08:54 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/12 1:52 PM, Khem Raj wrote:
> On Thu, May 17, 2012 at 11:49 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>>
>> One thing I did forget to note in this message.  If you are NOT using
>> OEBasicHash,
>
> since this is not default in OE-Core may be forces PR bumps for the affected
> recipes along with this series would make sense.
>

Seemed silly to be to bump a PR w/o a change.. but I'll do and do that.

Update soon...

--Mark


