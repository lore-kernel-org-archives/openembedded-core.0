Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id A6BB46A9D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 12:54:30 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id q200so2450748ykb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 04:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Vps/hkaJr10SokpDODwBShHYaOVaCDUS3vN9D9yfAJI=;
	b=LdUgt0c1RDRn3eoyPyGljkpeuQh4nVjhscl00WWh/kh6vwCg6TANZMlXOcg8VEZbFf
	At5UtDrJuNfdh67RVMbA0fuauogYre3KHoLwxvMFt4hqjrQKJ06EABodPA4CnEk3E3++
	dJDvyNgAnYjqUA4kbiWZ7Pojb/xnlbp3Lb1q1AFrAlqRgmNtIDDFE3V7jhjTC9HkWWXA
	ZOoAvZLqOAxhvwmTuIIVQXYZElgGMyTlNcaLFJ0N0j8GSe3Qx9HPvOi6cRSEohe+gyga
	6zowwnBNcxGAHboPvkWF5aUWyOn3XQLgdM/Foviu2IBj16cch/CTfqo1TZcDDV2dO6ka
	DElw==
MIME-Version: 1.0
X-Received: by 10.236.44.8 with SMTP id m8mr9874198yhb.136.1415969671302; Fri,
	14 Nov 2014 04:54:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Fri, 14 Nov 2014 04:54:31 -0800 (PST)
In-Reply-To: <20141114121322.GG2458@jama>
References: <1415959113-8920-1-git-send-email-diego.sueiro@gmail.com>
	<20141114121322.GG2458@jama>
Date: Fri, 14 Nov 2014 10:54:31 -0200
X-Google-Sender-Auth: TNbMkv-j6JoUsOD3weodRrfT5r0
Message-ID: <CAP9ODKqzx3ceVhtewPEsemP40mAchQ-cGoSsk=Q74_DY1mzeaA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 14 Nov 2014 12:54:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 14, 2014 at 10:13 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Nov 14, 2014 at 07:58:33AM -0200, Diego Sueiro wrote:
>> Stable branch was removed on mainline and now 5.3
>> is used.
>
> Please resend to openembedded-devel@lists.openembedded.org

I took care of this patch already Martin; no need.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

