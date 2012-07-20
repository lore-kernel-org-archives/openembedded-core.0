Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SsHvx-0005Yn-DB
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 20:28:13 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so5831435pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ThbIjGt1ZCQJKd4J4HzILK72WxoLxnpyChDRs7QCPFs=;
	b=ZYKx1dckUKi4yyzxyUEluIccsdFHk51LUOrrzOlMcND77PNMFMwZ/hEMhHsx1MEQm4
	B9OQ0TtG1u9+4Lllr6sHOffuOi7x7tRarhFYvilRuMmvsKZJqstVLc9qvRnjiw+kcAct
	tfGhrKylvkJ9jivjhuKh7iX9tGPXAzFxBH3X9cprB5ZEaxK4l49FGobqlVyUKGNvRpTW
	tbCRAwFHpEgW2okKf2Tzvq64elzkJ/Y5iKCgzc742PhH1cYOSrBWgO+kCEU9hio/sXix
	uIeTNNHFIcZ5vxoXc//1UYIpDZxoUe+I4Nq3e2KZv2n0tMIu+9Ap3FTvMwDh80I/zUe2
	qYAg==
MIME-Version: 1.0
Received: by 10.68.231.233 with SMTP id tj9mr15834566pbc.39.1342808211836;
	Fri, 20 Jul 2012 11:16:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.63.102 with HTTP; Fri, 20 Jul 2012 11:16:51 -0700 (PDT)
In-Reply-To: <1342808031-21564-2-git-send-email-otavio@ossystems.com.br>
References: <1342808031-21564-1-git-send-email-otavio@ossystems.com.br>
	<1342808031-21564-2-git-send-email-otavio@ossystems.com.br>
Date: Fri, 20 Jul 2012 15:16:51 -0300
X-Google-Sender-Auth: FiDKgx0N5SuIP4LBaUuP6pFDOlE
Message-ID: <CAP9ODKq0_7mjdG-g6QMTeqjJcgrud6TeFcmkeGAwRr-cY1vhqA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] shadow: use 'users' group by default
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
X-List-Received-Date: Fri, 20 Jul 2012 18:28:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 20, 2012 at 3:13 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

This would be nice to have included in next denzil.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


