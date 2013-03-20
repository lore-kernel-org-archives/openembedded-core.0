Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UIJr0-0003FO-CN
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 15:19:12 +0100
Received: by mail-ob0-f171.google.com with SMTP id x4so1639195obh.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=t7zhBjQBx3Q4z53bNyiGRjWLli5KJPHVi8QNt4oBzGc=;
	b=NhQvavQQlkv3RNvUuQCFa70ZbCni+R7Dk7le6ymfaZUeLmU9Fv1Xp5OLo0TdMoNDI6
	lyDqJ1wQIrOUo6qGv5mpDor1+HZMbLaDI8ax+JfVNNSqKTJuWm9l/6Yl2r6y1sqdQgKQ
	6D+8zCkqAin5NuqvzSPHF+a0Mnk/H+77wJ/GVs533QlBEAwOEb/nC9Uss4jflmCk0Vhq
	kQwyA6863YkMo/2vTalVgt2N2J0RgXoPLemqLQ8ta8K32QAJ0N/lK5oC1IoKt4bFBsG4
	JG1gy/feHTaWwR/Jdo5q7MkUZNOX4d+Km15g6PQeQcjxQouRJdsdpNQlCWxQ36bXyn3w
	hb1A==
MIME-Version: 1.0
X-Received: by 10.182.157.104 with SMTP id wl8mr4162451obb.79.1363788126806;
	Wed, 20 Mar 2013 07:02:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Wed, 20 Mar 2013 07:02:06 -0700 (PDT)
In-Reply-To: <1363724207-31476-1-git-send-email-mark.hatle@windriver.com>
References: <1363724207-31476-1-git-send-email-mark.hatle@windriver.com>
Date: Wed, 20 Mar 2013 11:02:06 -0300
X-Google-Sender-Auth: pdYdBxMkuLB0GJ0nc7B4zOsyLeU
Message-ID: <CAP9ODKpnych3aiFtvZnLyNk-KvQ_ysMH8oHC=bgD1w6q5P=feQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-multilib-example: Location of core-image-sato.bb changed
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
X-List-Received-Date: Wed, 20 Mar 2013 14:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 19, 2013 at 5:16 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

I'd expect it to go to skeleton?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


