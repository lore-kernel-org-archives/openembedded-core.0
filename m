Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 72EA06E368
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:23:24 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j17so1973084oag.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=W6Vbnsj7OEZOVr3C5WDLPhOjPxmZQqJbcQGyggBOdWw=;
	b=rMWagElitkCzVeXnFrI6Z+d0CqOwSFBKbd8epuuZAiP5UBB7mb0jYgFch77A6Edwi9
	ggojzH33vrj1GzHrzMkC8abgDsZ0idXbqXZwqhvuq3Xo4ZJT64lDfdvyxlU/K/t9qLlU
	XTT9SY5qrVWTCAxcRRVe/atRKhk7nDWMUdHCPMzR0Z0yTsF5urK8dbITG3NzBMFa/mLP
	nQ66OG6G356Uz7ix8x1tFHgi32OycUoeNeyoYkecQFw8koGFVhZhh+qgzVKf57jQy8Ul
	tliTJvqvbZ+1WZzIBEuPqnmnTtvWWRMaK2x51d248kNbMT4MucedZgwfjA9GEEar0eDD
	aNwQ==
MIME-Version: 1.0
X-Received: by 10.60.94.175 with SMTP id dd15mr189181oeb.56.1390476205467;
	Thu, 23 Jan 2014 03:23:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 03:23:25 -0800 (PST)
In-Reply-To: <704399111268889109191be3033345e4231d8b0c.1390461001.git.Qi.Chen@windriver.com>
References: <cover.1390461001.git.Qi.Chen@windriver.com>
	<704399111268889109191be3033345e4231d8b0c.1390461001.git.Qi.Chen@windriver.com>
Date: Thu, 23 Jan 2014 09:23:25 -0200
X-Google-Sender-Auth: ddGnOjcT8avNY87XFVOqUMpQzKE
Message-ID: <CAP9ODKqhUB+fO6N-0rtw9rsdPT7q1QaGrdfNCavPrYFKv8M8FA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] udev: fix typo
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
X-List-Received-Date: Thu, 23 Jan 2014 11:23:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 5:10 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Fix the typo in the RDEPENDS statement to make it have real effect.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

