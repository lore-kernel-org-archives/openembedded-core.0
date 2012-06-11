Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Se6Go-0002A9-3z
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 17:11:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5BD14Bm019043
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Jun 2012 06:01:04 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 11 Jun 2012 06:01:03 -0700
Message-ID: <4FD5EC05.7070105@windriver.com>
Date: Mon, 11 Jun 2012 09:00:53 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1339164527.git.bruce.ashfield@windriver.com>
	<1339419155.30460.21.camel@ted>
In-Reply-To: <1339419155.30460.21.camel@ted>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto/3.2: fix meta SRCREV typo
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
X-List-Received-Date: Mon, 11 Jun 2012 15:11:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-06-11 08:52 AM, Richard Purdie wrote:
> On Fri, 2012-06-08 at 10:10 -0400, Bruce Ashfield wrote:
>> Richard/Saul,
>>
>> Argh. I need a brown paper bag .... being focused on 3.4 hid
>> thsi from me.
>>
>> Never underestimate the power of a rebase for inserting fat finger
>> errors that are hidden by local layers.
>>
>> An extraneous character made it into the 3.2 meta SRCREV, which makes
>> the fetcher error, even when the kernel isn't being built.
>
> I came to Tom's patch first but a fix has been merged.

No worries, I'm glad it's in. I can take the paper bag off my head
now.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>



