Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPz8K-0005Ao-1t
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 19:16:16 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so1209835pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 10:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=eQqZmxIR45RLD63ow2Om+N+l9lbj+KBAnVBlonuM/94=;
	b=ONYRiPj2xYLDSwutig4+4Ss8ppiRvYBdOBddtwVpnvdt2VCA53MMYpxEndUy9Vw846
	W6XxL6icBfssl+BhVq1bdXgoliYlJz1VLAGLPMYNSDkRKrCQiDbmlQPYQCamNEWGknVa
	a/XX8ptX78wVJtpIn4QINNpWSkJFPP+x6r6D/57ahyrCMAhnzPRYkwaIM4n3wIrQwdZE
	52ecSkQWjm4XgZGEK2cn+TAF9/ociqvdTnRQlB9tE6VUsaWGwDz/n5YJOhVUYXF/Hvnh
	etyA9sB7Vy+rhX+TsNgmCrfIv8t+zTSX7ByeZKriXKjTF9rNY8P/1MEdO214lzIA6tuB
	CQIA==
MIME-Version: 1.0
Received: by 10.68.135.168 with SMTP id pt8mr23706393pbb.24.1350838971643;
	Sun, 21 Oct 2012 10:02:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sun, 21 Oct 2012 10:02:51 -0700 (PDT)
In-Reply-To: <cover.1350833713.git.andrei@gherzan.ro>
References: <cover.1350833713.git.andrei@gherzan.ro>
Date: Sun, 21 Oct 2012 15:02:51 -0200
X-Google-Sender-Auth: LlzEZ1Dq-EPyejjVDJUza9xlo7Q
Message-ID: <CAP9ODKpUJp8w+chWAN6z5wM+GVqBkkuArScyHm3oEYZiPcELjg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/5] FIX #2431 and other opkg / ipk related fixes
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
X-List-Received-Date: Sun, 21 Oct 2012 17:16:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 21, 2012 at 1:40 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> V2:
> Have rootfs_ipk.bbclass formatting changings in a different commit.
> Thanks: Otavio Salvador <otavio@ossystems.com.br>

Good; my acked-by for whole series.

Thanks,

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


