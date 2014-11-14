Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id CD67072111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 10:49:28 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id t59so3009646yho.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 02:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=KmFlK40QC6Wi1s3nJU6qYS0MA2XKVefTKxw8lIIv4lE=;
	b=mLQzdf25LMBXLFLdrtyKxlc74dhLeNlZlJmztxx2Xpe6Ey8ZDHCLqHmnuZqSGpZHVi
	WPiq2pY4wWV9Rn9BCp8UWU7rkkHzlHCQr7zskiJM4z3oPVvIcJ4omPprNu9I0R7cYahM
	1xsTSHvDEgOdVsA4lFia2Vae+hbgKEU5Kam0sE5qgLLwnRf3L4tHp3/dePker0tEKVG2
	q22+lRCLv0WlNSVhXWwqsqYOKtcYtIW2M1Tj7wR3Y+BDEBnnozgJa6R8YF0qwEJWlX0e
	/QIk47aemSWVpag7QimDcd5RqBrKdP1VudWhG0/j3//ra7hYmEPE4f5Q55ujVHoVLY2W
	CDWQ==
MIME-Version: 1.0
X-Received: by 10.170.60.87 with SMTP id c84mr4258440ykc.99.1415962168937;
	Fri, 14 Nov 2014 02:49:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Fri, 14 Nov 2014 02:49:28 -0800 (PST)
In-Reply-To: <1415959113-8920-1-git-send-email-diego.sueiro@gmail.com>
References: <1415959113-8920-1-git-send-email-diego.sueiro@gmail.com>
Date: Fri, 14 Nov 2014 08:49:28 -0200
X-Google-Sender-Auth: HmQ1yokrrenr0QSn9rYZbn2enQg
Message-ID: <CAP9ODKrscVSj=kdrXvCSmULQqttdyfEq6pKjhJhg+3e7GkXAaQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Nov 2014 10:49:34 -0000
Content-Type: text/plain; charset=UTF-8

Hello Diego,

On Fri, Nov 14, 2014 at 7:58 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> Stable branch was removed on mainline and now 5.3
> is used.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>

meta-qt5 patches ought to be send to OpenEmbedded-Devel mailing list.

You don't need to resend this one as I will pick it but please post to
the right list next time.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

