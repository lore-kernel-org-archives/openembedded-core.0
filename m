Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE2472115
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 10:52:35 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id f73so743647yha.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 02:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=yTIsJHIqFNoxiLC0oeGnJk48tNyYm4S94GtTgyI3yVE=;
	b=GCYXoOJlTMhIDa+tXJdJrlaQnwSE1OZMBY+0aQ3xO7WgLXjG1CSQN/OYonR0jj5zQA
	EOm5TLYv/YvjQAXJcaltF+PNOKh+FdZDOniOZV4MhZDuRDXtzD2qh09B0in6dvNhipsI
	vPiYe8iOsN9oPtY/s5C5Ei4wikdThB3lJh+BuTDAt7HzA58f4G67xxyQxPqGFVm+EpXp
	3HiCTFj2CLdpJT/Lee/1i3LNaSRAryVHUGOs6oUFYMzKq4bcpG7Fys+AAq/KzbrPDeL1
	866lg/EJaJjP2Zf2OZYwKIdUeBSNkvIk2iAYRCmJi325Qm2aIpNR+N4fpwkFqyeP1iB7
	Gnew==
MIME-Version: 1.0
X-Received: by 10.236.41.71 with SMTP id g47mr9151384yhb.90.1415962355928;
	Fri, 14 Nov 2014 02:52:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Fri, 14 Nov 2014 02:52:35 -0800 (PST)
In-Reply-To: <CAMCfZKENk_=z7CETjEB+DkBpeTzpPnYfsr3BdAZzBt6zvsy1Lw@mail.gmail.com>
References: <1415959113-8920-1-git-send-email-diego.sueiro@gmail.com>
	<CAP9ODKrscVSj=kdrXvCSmULQqttdyfEq6pKjhJhg+3e7GkXAaQ@mail.gmail.com>
	<CAMCfZKENk_=z7CETjEB+DkBpeTzpPnYfsr3BdAZzBt6zvsy1Lw@mail.gmail.com>
Date: Fri, 14 Nov 2014 08:52:35 -0200
X-Google-Sender-Auth: 7KNxtVCjsFAH49Fcc8XgQT_uudU
Message-ID: <CAP9ODKoqP3s1bnJYTQpkzWTOCUcCUTs5iRZxd-cjtQwpu2oHtw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtsystems: Change branch from stable to 5.3
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
X-List-Received-Date: Fri, 14 Nov 2014 10:52:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 14, 2014 at 8:51 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> On Fri, Nov 14, 2014 at 8:49 AM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> Hello Diego,
>>
>> On Fri, Nov 14, 2014 at 7:58 AM, Diego Sueiro <diego.sueiro@gmail.com>
>> wrote:
>> > Stable branch was removed on mainline and now 5.3
>> > is used.
>> >
>> > Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
>>
>> meta-qt5 patches ought to be send to OpenEmbedded-Devel mailing list.
>>
>> You don't need to resend this one as I will pick it but please post to
>> the right list next time.
>
>
> Sorry about that.

No problem; I applied it for dizzy and master branches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

